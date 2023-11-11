#!/bin/bash

# Nazwa pliku do zapisu wyników
output_file="mojruch.txt"

# Wywołanie tcpdump w tle i przekierowanie wyników do pliku
tcpdump -i any -n -tttt -q | awk '{print $1, $3, $5, $7, $2}' >> "$output_file"

# Pobierz identyfikator procesu tcpdump
tcpdump_pid=$!

# Monitoruj ruch co określony okres czasu (np. co 10 sekund)
interval=5
while true; do
    sleep $interval
    # Sprawdź, czy tcpdump nadal działa
    if ps -p $tcpdump_pid > /dev/null; then
        echo "Monitorowanie ruchu w trakcie. Wciśnij Ctrl+C, aby zakończyć."
    else
        echo "Błąd - tcpdump zakończył działanie."
        break
    fi
done

# Po zakończeniu monitorowania, wyświetl komunikat i zakończ tcpdump
echo "Zakończono monitorowanie ruchu. Wyniki zapisane w $output_file"
kill $tcpdump_pid
