# Projekt: Rpi5 zamiast radia w samochodzie

## Plan działania

### Etap 1: Testy podstawowe (bez CAN i z użyciem podstawowego audio na RPi)
- [ ] Uruchomienie podstawowego systemu audio w RPi.
  - Testowanie dostępnych urządzeń oraz sterowników audio.
  - Zainstalowanie konfiguracji ALSA i PulseAudio.
- [ ] Przygotowanie interfejsu wizualnego (GUI):
  - **Silnik GUI:** Flutter (ze względu na nowoczesny wygląd, skalowalność i możliwość migracji na mini PC).
  - Wygląd jak nowoczesne radio samochodowe.
  - Obsługa:
    - Spotify
    - YouTube
    - Google Maps
    - Locus Maps
- [ ] Weryfikacja działania aplikacji GUI oraz responsywności.

### Etap 2: Integracja z systemami zewnętrznymi (CAN oraz wzmacniacze audio)
**Do realizacji w późniejszej fazie:**
- [ ] Zintegrowanie magistrali CAN (przygotowanie sterowników i testy z PiCAN).
- [ ] Rozbudowa układu audio:
  - Podłączenie zewnętrznego DAC/DSP dla optymalnej jakości dźwięku.

### Etap 3: Rozbudowa funkcjonalności GUI
- [ ] Dodanie obsługi dodatkowych funkcji (np. zmiana ustawień DSP, kamery cofania itp.).

## Aktualne zasoby
- **Raspberry Pi 5**
- **Ekran 10” dotykowy**
- **RPi OS 64bit Bookworm** na dysku NVMe
- **Wzmacniacze audio w samochodzie**

## Uwagi
Aktualizacje planu będziemy wprowadzać wraz z postępami w realizacji.