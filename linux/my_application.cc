#include "my_application.h"  // Załączamy deklarację klasy MyApplication.
#include "flutter/generated_plugin_registrant.h"  // Załączamy rejestrator wygenerowanych wtyczek.

#include <flutter_linux/flutter_linux.h>  // Główne nagłówki Flutter dla aplikacji Linux.
#include <gtk/gtk.h>                     // GTK dla obsługi GUI.
#include <glib/gstdio.h>                 // GIO dla wsparcia funkcji związanych z systemem.

#if defined(GDK_WINDOWING_X11)
#include <gdk/gdkx.h> // Załącznik X11 dla funkcji specyficznych dla backendu X11.
#endif

// Struktura definiująca aplikację MyApplication.
struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

// Implementacja aktywacji aplikacji.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);

  GtkWindow* window = GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(application)));
  gtk_window_set_title(window, "rpi5_car_radio");
  gtk_window_set_default_size(window, 1280, 720);

  // Specyficzne dla X11: Jeśli backend X11 jest dostępny.
#if defined(GDK_WINDOWING_X11)
  if (GDK_IS_X11_SCREEN(gdk_screen_get_default())) {
    auto display_name = gdk_x11_screen_get_window_manager_name(gdk_screen_get_default());
    g_print("Window manager: %s\n", display_name);
  }
#endif

  gtk_widget_show(GTK_WIDGET(window));

  // Inicjalizacja projektu Dart.
  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(project, self->dart_entrypoint_arguments);

  // Inicjalizacja widoku Flutter.
  FlView* view = fl_view_new(project);
  gtk_widget_show(GTK_WIDGET(view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));

  // Rejestracja wtyczek.
  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

  gtk_widget_grab_focus(GTK_WIDGET(view));
}

// Implementuje GApplication::local_command_line.
static gboolean my_application_local_command_line(GApplication* application, gchar*** arguments, int* exit_status) {
  MyApplication* self = MY_APPLICATION(application);

  // Usuń pierwszy argument (nazwa binarki Fluttera).
  self->dart_entrypoint_arguments = g_strdupv(*arguments + 1);

  g_autoptr(GError) error = nullptr;
  if (!g_application_register(application, nullptr, &error)) {
    g_warning("Failed to register: %s", error->message);
    *exit_status = 1;
    return TRUE;
  }

  g_application_activate(application);
  *exit_status = 0;

  return TRUE;
}

// Implementacja GObject::dispose.
static void my_application_dispose(GObject* object) {
  MyApplication* self = MY_APPLICATION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  G_OBJECT_CLASS(my_application_parent_class)->dispose(object);
}

// Klasa MyApplication: rejestracja funkcji GTK i ich inicjalizacji.
static void my_application_class_init(MyApplicationClass* klass) {
  G_APPLICATION_CLASS(klass)->activate = my_application_activate;
  G_APPLICATION_CLASS(klass)->local_command_line = my_application_local_command_line;
  G_OBJECT_CLASS(klass)->dispose = my_application_dispose;
}

// Implementacja inicjalizacji aplikacji.
static void my_application_init(MyApplication* self) {}

// Inicjalizacja nowej aplikacji.
MyApplication* my_application_new() {
  return MY_APPLICATION(g_object_new(my_application_get_type(),
                                     "application-id", "com.example.rpi5_car_radio",
                                     "flags", G_APPLICATION_NON_UNIQUE,
                                     nullptr));
}
