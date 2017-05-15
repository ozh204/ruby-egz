# Gofry

Piotr Laskowski, Jakub Wiśniewski (egzamin)

https://ozh204-gofry.herokuapp.com/
		
| Ruby       | Rails | Baza     |
| :--------: |:-----:| :-------:|
| 2.4.0      | 5.0.2 | postgres |

Aplikacja umożliwia dodawanie, usuwanie, modyfikowanie oraz wyświetlanie gofrów.
Korzystano z technologii grid.
Skorzystałem z następujących niestandardowych gemów:

- bootstrap 4.0.0.alpha6        - szybka edycja widoków
- bcrypt 3.1.11                 - szyfrowanie hasła
- rails-controller-testing      - testowanie kontrolerów
- carrierwave-dropbox           - wrzucanie obrazkow na zdalny serwer dropbox
- mini_magick 4.6.1             - skalowanie obrazów
- neat                          - automatyzacja technologii grid, co okazało się porażką
- font_awesome 			- czcionka zawierająca wiele obrazków
- better_errors                 - błedy wyświetlane przez program są bardziej czytelne
- binding_of_caller             - dostęp do konsoli z przeglądarki w widoku zmienionego błedu dzięki better-errors

Konta do logowania:

| Email            | Hasło      |
| :--------------: |:----------:|
| admin@gmail.com  | adminadmin |
| worker@gmail.com | adminadmin |
| user@gmail.com   | adminadmin |
