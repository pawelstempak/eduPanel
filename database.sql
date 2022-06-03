-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 02 Cze 2022, 21:32
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sand`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `haslo` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `admin`
--

INSERT INTO `admin` (`id`, `name`, `lastname`, `email`, `haslo`) VALUES
(28, 'Paweł', 'Stempak', 'admin@admin.com', '123456');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answers`
--

CREATE TABLE `answers` (
  `id_answer` int(11) NOT NULL,
  `name` text NOT NULL,
  `id_question` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `answers`
--

INSERT INTO `answers` (`id_answer`, `name`, `id_question`, `status`, `sort`) VALUES
(1, 'Ciąg niepowiązanych ze sobą słów.', 1, 0, 1),
(2, 'Cechy osoby fizycznej, dzięki którym można ja zidentyfikować.', 1, 1, 2),
(5, 'Zaszyfrowana informacja', 1, 0, 3),
(6, 'Marka, kolor, numer nadwozia pojazdu', 1, 0, 4),
(7, 'Przygotowujemy ofertę dla klienta, posiadając zgodę na przetwarzanie danych osobowych w tym celu.', 2, 0, 1),
(8, 'Wystawiamy dokument sprzedaży (faktura VAT) za zakupiony towar.', 2, 0, 2),
(9, 'Wysyłamy dane pracownika do ZUS', 2, 0, 3),
(10, 'Przechowujemy formularze CV po zakończonej rekrutacji na konkretne stanowisko.', 2, 1, 4),
(11, 'Numer PESEL', 3, 0, 1),
(12, 'Imię i nazwisko', 3, 0, 2),
(13, 'Informacja o posiadanej grupie inwalidzkiej', 3, 1, 3),
(14, 'Adres e-mail', 3, 0, 4),
(15, 'Zablokowanie ekranu komputera lub wylogowanie się z systemu.', 4, 0, 1),
(16, 'Zamknięcie drzwi na klucz.', 4, 0, 2),
(17, 'Zamknięcie dokumentów zawierających dane osobowe w szafie lub szufladzie biurka.', 4, 0, 3),
(18, 'Wysyłka zaległej poczty e-mail z folderu kopie robocze.', 4, 1, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attachment`
--

CREATE TABLE `attachment` (
  `id_attachment` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `id_lesson` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `course`
--

CREATE TABLE `course` (
  `id_course` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `desc1` text DEFAULT NULL,
  `desc2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `course`
--

INSERT INTO `course` (`id_course`, `name`, `desc1`, `desc2`) VALUES
(4, 'Ochrona danych osobowych ', 'Kurs przewiduje omówienie zagadnień z zakresu ochrony danych osobowych oraz bezpieczeństwa informacji w przedsiębiorstwie prywatnym. Składa sie z części teoretycznej oraz krótkiego testu.', 'Na zapoznanie się z tematem kursu, proszę sobie przeznaczyć od 10 do 20 minut czasu.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exams`
--

CREATE TABLE `exams` (
  `id_exam` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `desc1` text DEFAULT NULL,
  `desc2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `exams`
--

INSERT INTO `exams` (`id_exam`, `name`, `desc1`, `desc2`) VALUES
(1, 'Test wiedzy z zakresu ochrony danych osobowych', 'Kurs kończy krótki test wiedzy, składający się z kilku pytań. By ukończyć kurs należy na wszystkie pytania odpowiedzieć poprawnie. Na każde z pytań istnieje tylko jedna poprawna odpowiedź.', 'Test nie zajmie Ci więcej niż 5 minut. Powodzenia :)');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exam_course`
--

CREATE TABLE `exam_course` (
  `id_exam_course` int(11) NOT NULL,
  `id_exam` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `exam_course`
--

INSERT INTO `exam_course` (`id_exam_course`, `id_exam`, `id_course`, `sort`) VALUES
(38, 1, 4, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `e_session`
--

CREATE TABLE `e_session` (
  `id_e_session` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `session` text NOT NULL,
  `start` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lesson`
--

CREATE TABLE `lesson` (
  `id_lesson` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `lesson`
--

INSERT INTO `lesson` (`id_lesson`, `name`, `content`) VALUES
(45, 'Czym jest RODO?', '<p><img class=\"responsive-img\" src=\"../images/RODO-kopia1603881628.png\" /></p>\r\n<p>RODO to nic innego jak Rozporządzenie Parlamentu Europejskiego, kt&oacute;re reguluje ochronę os&oacute;b fizycznych, w związku z przetwarzaniem ich danych osobowych oraz pozwala w dokładniejszy spos&oacute;b panować nad tym co dzieje się naszymi danymi osobowymi wykorzystanymi przez firmy, instytucje, banki i urzędy.</p>\r\n<p>RODO dotyczy każdej osoby przebywającej na terenie Unii Europejskiej, kt&oacute;ra objęta jest zakresem prawa Unii. Stosujemy je zawsze we wszystkich czynnościach związanych z danymi osobowymi. Wyjątek stanowią czynności o czysto osobistym, &nbsp;domowym charakterze lub czynności wykonywane przez instytucje, organy powołane do zapobiegania przestępczości, prowadzenia postępowań, wykrywaniu i ściganiu czyn&oacute;w zabronionych lub wykonywaniu kar.</p>'),
(46, 'Co to są dane osobowe oraz szczególne kategorie danych osobowych?', '<p><strong><img class=\"responsive-img\" src=\"../images/system-825314_1920-1-1024x7241603891293.jpg\" /></strong></p>\r\n<p><strong>Dane osobowe</strong> to informacje pozwalające bezpośrednio lub pośrednio na zidentyfikowanie osoby fizycznej za pomocą identyfikatora jak np. imię i nazwisko czy też jednego lub wielu czynnik&oacute;w określających cechy fizyczne, fizjologiczne, umysłowe, ekonomiczne, kulturowe czy społeczne. Takie informacje, kt&oacute;re wymagają nadmiernych koszt&oacute;w, czasu czy działań do zidentyfikowania osoby nie są traktowane jako dane osobowe.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Przykłady danych osobowych:</strong></p>\r\n<p style=\"padding-left: 40px;\">- imię i nazwisko;</p>\r\n<p style=\"padding-left: 40px;\">- adres zamieszkania;</p>\r\n<p style=\"padding-left: 40px;\">- adres e-mail, taki jak <a href=\"mailto:imi%C4%99.nazwisko@firma.com\">imię.nazwisko@firma.com</a>; (zawierający w swojej nazwie imię i nazwisko lub informację identyfikująco bezpośrednio osobę fizyczną)</p>\r\n<p style=\"padding-left: 40px;\">- numer dowodu tożsamości;</p>\r\n<p style=\"padding-left: 40px;\">- dane o lokalizacji (np. ustawienia lokalizacji w telefonie kom&oacute;rkowym)*;</p>\r\n<p style=\"padding-left: 40px;\">- adres IP;</p>\r\n<p style=\"padding-left: 40px;\">- identyfikator plik&oacute;w cookie;</p>\r\n<p style=\"padding-left: 40px;\">- identyfikator reklamowy w telefonie kom&oacute;rkowym;</p>\r\n<p style=\"padding-left: 40px;\">- dane przechowywane przez szpital lub lekarza, kt&oacute;re mogą jednoznacznie wskazywać tożsamość danej osoby.</p>\r\n<p style=\"padding-left: 40px;\">&nbsp;</p>\r\n<p><strong>Szczeg&oacute;lna kategoria danych osobowych</strong> potocznie zwane danymi wrażliwymi to informacje, kt&oacute;ra ze względu na sw&oacute;j charakter są objęte szczeg&oacute;lną ochroną. Dane takie opisują pochodzenie rasowe lub etniczne, poglądy polityczne, przekonania religijne i światopoglądowe, przynależność do związk&oacute;w zawodowych, dane biometryczne umożliwiające zidentyfikowanie osoby fizycznej, medyczne oraz dotyczące seksualności lub orientacji seksualnej.</p>\r\n<p><strong>Przykłady szczeg&oacute;lnych kategorii danych osobowych:</strong></p>\r\n<p style=\"padding-left: 40px;\">- informacja o przynależności do wsp&oacute;lnoty religijnej np. akt chrztu;</p>\r\n<p style=\"padding-left: 40px;\">- informacja potwierdzająca przynależność do formacji politycznej;</p>\r\n<p style=\"padding-left: 40px;\">- informacja o stanie zdrowia np. orzeczenie lekarskie o niepełnosprawności lub zwolnienie lekarskie</p>\r\n<p style=\"padding-left: 40px;\">- odcisk palca</p>\r\n<p style=\"padding-left: 40px;\">- wizerunek, głos, wygląd tęcz&oacute;wki oka,</p>\r\n<p style=\"padding-left: 40px;\">- własnoręczny podpis.</p>'),
(47, 'Przetwarzanie danych osobowych - definicja.', '<p><img class=\"responsive-img\" src=\"../images/zgoda-900x3221604040924.jpg\" alt=\"\" /></p>\r\n<p><strong>Przetwarzania danych osobowych</strong> oznacza operacje (czynność) lub zestaw operacji (czynności) wykonywanych na danych osobowych takie jak: zbieranie, utrwalanie, organizowanie, porządkowanie, przechowywanie, modyfikowanie, pobieranie, przeglądanie wykorzystanie, rozpowszechnianie lub innego rodzaju udostępnianie, dopasowywanie lub łączenie, ograniczenie, usuwanie czy niszczenie.</p>\r\n<p>Przetwarzanie oznacza jakąś operację wykonywaną na danych osobowych włącznie z dostępem do tej informacji czy samym jej przechowywaniem.</p>\r\n<p>Przykładem może być tutaj pozyskanie, utrwalenie oraz wykorzystanie danych osobowych celem wystawienia dokumentu sprzedaży, np. faktury VAT. Innym przykładem jest zebranie danych dotyczących rekrutacji potencjalnego pracownika. Podstawowy dokument składany przez osobę fizyczną w trakcie rekrutacji na stanowisko, Curriculum vitae, jest pełne danych osobowych, takich jak imię, nazwisko, płeć, wiek, adres zamieszkania itp.</p>'),
(48, 'Zasady przetwarzania danych osobowych', '<p><img class=\"responsive-img\" src=\"../images/zgoda-na-przetwarzanie-danych-podpis-banner1604042342.jpg\" /></p>\r\n<p>Zasady przetwarzania danych osobowych dzielą się na kilka reguł, kt&oacute;rych przestrzeganie sumuje się na prawo do przetwarzania danych. Jeżeli nie stosujemy się do zasad przetwarzania danych osobowych, to pomimo spełnienia wymogu prawnego np. uzyskania zgody na przetwarzanie danych osobowych, nie możliwe jest przetwarzanie danych.</p>\r\n<p>Zasady przetwarzania danych osobowych:</p>\r\n<p>- <strong>rzetelność, przejrzystość i zgodność z prawem</strong> &ndash; należy przetwarzać dane w spos&oacute;b rzetelny, przejrzyście, czyli w spos&oacute;b łatwy do zrozumienia dla osoby, kt&oacute;rej dane dotyczą oraz zgodny z prawem, czyli musi istnieć podstawa prawna do ich przetwarzania. należy tu zwr&oacute;cić uwagę na obowiązek informacyjny, czyli zapewnienie i dostarczenie osobie, kt&oacute;rej dane dotyczą informacji o przetwarzaniu jego danych osobowych.</p>\r\n<p>- <strong>ograniczenie celu</strong> &ndash; rejestrowanie danych w konkretnych, wyraźnych i prawnie uzasadnionych celach i nie przetwarzanie ich dalej w spos&oacute;b niezgodny z tymi celami, co należy rozumieć poprzez przetwarzanie danych wyłącznie w sprawie jakiej dotyczy ustalony cel przetwarzania, np. zbierając dane celem wystawienia dokumentu sprzedaży nie wolno nam używać ich do przekazywania za pomocą tych danych informacji marketingowych, ponieważ jest to całkowicie inny cel.&nbsp;</p>\r\n<p>- <strong>minimalizacja danych</strong> &ndash; przetwarzanie adekwatnie, stosownie i niezbędnie do realizacji celu, np. imię lub nazwisko oraz telefon, ale nie adres osoby fizycznej jest konieczny, aby przekazać klientowi informacje o cenie produktu. Dane potrzebne do wystawienia rachunku zbieramy dopiero na etapie realizacji zam&oacute;wienia. Inny przykład to informacje zbierane w trakcie wystawiania dokumentu sprzedaży.&nbsp; Nie należy pytać o datę urodzenia, ponieważ nie jest nam potrzebna taka informacja.</p>\r\n<p>- <strong>prawidłowość</strong> &ndash; należy dołożyć wszelkich starań, aby dane przetwarzane były prawidłowe, a jeżeli nie są niezwłocznie je poprawić lub usunąć. Jest to prosta zasada, kt&oacute;ra m&oacute;wi, że nie powinniśmy przetwarzać nieprawdziwych lub niekompletnych danych, kt&oacute;re mogą spowodować szkody zar&oacute;wno dla podmiotu przetwarzającego jak i samej osoby, kt&oacute;rej dane dotyczą. Jeżeli, widzimy nieprawidłowość w danych osobowych, to należy je skorygować, a jeżeli nie mamy możliwości potwierdzić ich poprawności to należy je usunąć.</p>\r\n<p>- <strong>ograniczenie przechowywania (retencja)</strong> &ndash; przechowywanie przetwarzanych danych przez okres nie dłuższy niż jest to niezbędne do cel&oacute;w, w kt&oacute;rych dane są przetwarzane np. zbierając dane do cel&oacute;w rekrutacji na stanowisko sprzedawcy, należy usunąć je gdy cel zostanie osiągnięty np. gdy nowy pracownik rozpocznie pracę na nowym stanowisku,&nbsp;</p>\r\n<p>- <strong>integralność i poufność</strong> &ndash; przetwarzanie danych w spos&oacute;b taki by dane nie uległy zniszczeniu lub przypadkowej utracie czy też ujawnieniu osobom nieupoważnionym do przetwarzania w tym wsp&oacute;łpracownikom, dotyczy to odpowiednich środk&oacute;w technicznych i organizacyjnych w celu zabezpieczenia danych m.in. przed ich przetwarzaniem z naruszeniem prawa, zmianą, utrata lub uszkodzeniem.</p>'),
(49, 'Przetwarzanie danych osobowych zgodnie z prawem', '<p><img src=\"../images/art41604474872.jpg\" alt=\"\" width=\"1210\" height=\"226\" /></p>\r\n<p>Jedną z zasad dotycząca przetwarzania danych osobowych jest przetwarzanie ich zgodnie z obowiązującym prawem. Poniżej om&oacute;wimy dokładniej jakie sytuacje oraz podstawy prawne pozwalają nam na przetwarzanie danych osobowych zgodnie z prawem.</p>\r\n<p>Warunkiem przetwarzania danych osobowych zgodnie z prawem jest zaistnienie jednej z kilku sytuacji, mianowicie:</p>\r\n<p>- <strong>potwierdzone uzyskanie zgody</strong> na przetwarzanie danych osobowych od osoby, kt&oacute;rej te dane dotyczą - pisemne, elektroniczne np. przycisk wyboru przed formularzem lub klauzula zgody załączona do składanego dokumentu. Osoba, kt&oacute;rej dane będziemy przetwarzać musi zostać o tym poinformowana, w jasny i oczywisty spos&oacute;b oraz wyrazić zgodę na ich przetwarzanie. W niekt&oacute;rych sytuacjach, opisanych niżej, nie jest nam potrzebne uzyskanie zgody takiej osoby, z uwagi na osobne przepisy prawa, np. obowiązek wystawienia dokumentu sprzedaży obliguje nas do przetwarzania danych osobowych.</p>\r\n<p>-<strong> dane zbierane od osoby są niezbędne do realizacji umowy</strong> z osobą, kt&oacute;rej te dane dotyczą lub do podjęcia działań, na żądanie tej osoby, do przygotowania umowy. Osobne przepisy prawa wymagają od nas do potwierdzenia zawarcia umowy dokumentem zawierającym dane osobowe. W takiej sytuacji nie jest konieczna osobna zgoda na przetwarzanie danych osobowych, ponieważ osoba, kt&oacute;rej dane do tyczą świadomie i dobrowolnie udostępnia swoje dane osobowe celem zawarcia takiej umowy. Np. umowa kupna - sprzedaży</p>\r\n<p>- <strong>konieczność zbierania danych osobowych od osoby fizycznej wynika z wypełniania obowiązku prawnego</strong> ciążącego zar&oacute;wno na podmiocie, kt&oacute;ry rejestruje dane jak i na osobie, kt&oacute;rej te dane dotyczą. Za przykład może posłużyć przetwarzanie danych osobowych zatrudnionych pracownik&oacute;w.&nbsp;</p>\r\n<p>- <strong>dane zbierane są w celu ochrony żywotnych interes&oacute;w</strong> osoby, rozumiejąc przez to zar&oacute;wno aspekt ochrony życia osoby, kt&oacute;rej dane dotyczą jak i os&oacute;b trzecich, ale także mając na uwadze względy ekonomiczne dotyczące tej osoby, ochronę jej majątku czy nieruchomości. Najczęstszym przypadkiem tego typu jest przekazanie informacji o osobie służbom medycznym - w przypadku zagrożenia zdrowia lub życia, gdy konieczne jest udzielenie informacji o osobie np. informacja o grupie krwi.&nbsp;</p>\r\n<p>- <strong>dane zbierane są w celu wypełnienia interesu publicznego</strong> lub sprawowania władzy publicznej powierzonej administratorowi danych. Przykładem może być zbieranie podpis&oacute;w celem poparcia wyborczego.</p>'),
(50, 'Upoważnienie do przetwarzania danych osobowych na stanowisku pracy', '<p><img src=\"../images/be11604568105.jpg\" alt=\"\" width=\"1203\" height=\"212\" /></p>\r\n<p>Każdy pracownik, kt&oacute;ry w ramach swoich obowiązk&oacute;w służbowych przetwarza dane osobowe, musi posiadać odpowiednie uprawnienia do przetwarzania danych osobowych w zadanym zakresie, odpowiednim do zajmowanego stanowiska oraz obowiązk&oacute;w służbowych.&nbsp;</p>\r\n<p>Zgodnie z Polityką Ochrony Danych Osobowych prowadzony jest rejestr czynności przetwarzania, czyli rejestr grup operacji przetwarzanych przez administratora. Zgodnie z takim rejestrem wydawane są&nbsp; upoważnienia do przetwarzania danych osobowych poszczeg&oacute;lnym pracownikom w danej sekcji, odpowiedzialnym za przetwarzania danych osobowych.</p>\r\n<p>Upoważnienie do przetwarzania danych osobowych to dokument wystawiony przez administratora danych osobowych, do przetwarzania danych osobowych w określonym zakresie oraz dołączone do akt osobowych.</p>\r\n<p>Jeżeli pracownik uzyskuje dostęp do nowej czynności przetwarzania jakim jest np. dostęp do korespondencji przychodzącej lub informacje o urlopach wtedy należy zgłosić to do Inspektora Ochrony Danych Osobowych celem wystawienia lub aktualizacji istniejącego upoważnienia.</p>'),
(51, 'Polityka czystego biurka i czystego ekranu.', '<p><img src=\"../images/RODO-kopia16038816281616065041.jpg\" alt=\"\" width=\"1203\" height=\"212\" /></p>\r\n<p>Bardzo istotną sprawą jest to, aby osoby kt&oacute;re nie mają upoważnienia do przetwarzania danych osobowych nie uzyskały dostępu do takich danych, nie tylko pod naszą nieobecność przy miejscu pracy, ale także w trakcie pracy.</p>\r\n<p>Podczas naszej pracy, żaden z wsp&oacute;łpracownik&oacute;w, szczeg&oacute;lnie spoza sekcji i działu, nie powinien mieć dostępu do dokument&oacute;w nad kt&oacute;rymi pracujemy. Oczywiście, do takich os&oacute;b zaliczamy także osoby niezatrudnione a przebywających na terenie zakładu. Dotyczy to zar&oacute;wno dokument&oacute;w w formie papierowej, jak i w formie cyfrowej, na nośnikach pamięci oraz na ekranie komputera. &nbsp;&nbsp;</p>\r\n<p>Jeżeli jest to tylko możliwe należy wdrożyć i stosować takie zasady pracy, aby zachować poufność dokument&oacute;w nad kt&oacute;rymi pracujemy. Dobrą praktyką podczas pracy z dokumentami jest stosowanie np. korytek czy szuflad na dokumenty, dzięki kt&oacute;rym dokumenty mamy pod ręką, ale informacje nie są w zasięgu wzroku os&oacute;b trzecich. Organizacja miejsca pracy powinna uwzględniać odpowiednie ustawienie monitora, w szczeg&oacute;lności w miejscach, do kt&oacute;rych dostęp mają osoby niezatrudnione w organizacji.</p>\r\n<p>Podczas pracy z dokumentami w formie cyfrowej dobrą praktyką jest uruchomienie na jednostkach komputerowych takich wygaszaczy ekranu, kt&oacute;re po wznowieniu pracy proszę o podanie hasła. Blokowanie ekranu komputera powinno być stosowane w przypadku opuszczenia stanowiska pracy. Przydatne jest także, zautomatyzowanie tego procesu poprzez ustawienie blokowania ekranu po określonym czasie.&nbsp;</p>'),
(52, 'Podsumowanie', '<p>Mając na celu utrwalenie wiedzy oraz dostęp do najnowszych informacji, co jakiś czas zostanie udostępniony firmowy newsletter, zwierający najistotniejsze informacje w sprawach bieżących, związanych z ochroną danych osobowych.&nbsp;</p>\r\n<p>Każdy z pracownik&oacute;w może zgłosić się do Inspektora Ochrony Danych Osobowych (biurowiec, pok&oacute;j numer 10, wew. 688), w każdej kwestii związanej z ochroną danych osobowych, ich przetwarzaniem oraz pomocą związaną z dostosowaniem się do nowych obowiązk&oacute;w. Dodatkowo na dysku wsp&oacute;lnym Y w katalogu RODO można zapoznać się z dokumentami związanymi z ochroną danych osobowych.</p>\r\n<p>W przypadku naruszenia zasad RODO, każdy z pracownik&oacute;w a w szczeg&oacute;lności osoby, kt&oacute;rych to dotyczy powinny zgłaszać zaistniały fakt zakładowemu Inspektorowi Ochrony Danych Osobowych.</p>');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lesson_course`
--

CREATE TABLE `lesson_course` (
  `id_lesson_course` int(11) NOT NULL,
  `id_lesson` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `lesson_course`
--

INSERT INTO `lesson_course` (`id_lesson_course`, `id_lesson`, `id_course`, `sort`) VALUES
(33, 45, 4, 1),
(34, 46, 4, 2),
(35, 47, 4, 3),
(36, 48, 4, 4),
(37, 49, 4, 5),
(38, 50, 4, 6),
(39, 51, 4, 7),
(40, 52, 4, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questions`
--

CREATE TABLE `questions` (
  `id_question` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `id_exam` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `questions`
--

INSERT INTO `questions` (`id_question`, `name`, `id_exam`, `sort`) VALUES
(1, 'Co to są dane osobowe?', 1, 1),
(2, 'Przetwarzając dane osobowe zgodnie z prawem, której z poniższych czynności nie powinniśmy robić?', 1, 2),
(3, 'Wskaż poniżej daną osobową należącą do szczególnej kategorii.', 1, 3),
(4, 'Opuszczasz swoje stanowisko pracy. Wybierz czynność, która nie ma wpływu na ochronę danych osobowych.', 1, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sections`
--

CREATE TABLE `sections` (
  `id_section` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `id_attachment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `stanowisko` varchar(200) NOT NULL,
  `udo` int(5) NOT NULL,
  `email` text DEFAULT NULL,
  `login` varchar(30) NOT NULL,
  `haslo` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id_user`, `name`, `lastname`, `stanowisko`, `udo`, `email`, `login`, `haslo`) VALUES
(101, 'User', 'User', 'Technolog', 15, 'technolog@nazwa.pl', 'user', '123456'),
(105, 'Tomasz', 'Tokarz', 'Analityk', 103, 'tokarz@poczta.fm', 'ttokarz', '06111985'),
(106, 'Paweł', 'Stempak', 'Projektant grafiki', 67, 'stempak@google.com', 'pstempak', '123456'),
(107, 'Marlena', 'Garbarz', 'Technolog', 16, 'marzenagarbarz@gmail.com', 'mgarbarz', '18051989'),
(108, 'Paulina', 'Kostek', 'Analityk', 59, 'kostek@firma.com', 'pkostek', '12091999');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_course`
--

CREATE TABLE `user_course` (
  `id_user_course` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `status` int(11) DEFAULT 0,
  `c_date` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `user_course`
--

INSERT INTO `user_course` (`id_user_course`, `id_user`, `id_course`, `status`, `c_date`) VALUES
(14, 101, 4, 1, 1615449248),
(15, 105, 4, 1, 1616074364),
(18, 106, 4, 1, 1620711187),
(20, 107, 4, 1, 1615883052),
(21, 108, 4, 1, 1616161141),
(22, 109, 4, 1, 1622544458),
(23, 111, 4, 1, 1616581279),
(24, 110, 4, 1, 1621614721),
(25, 112, 4, 1, 1616581234),
(26, 113, 4, 1, 1621494318),
(27, 115, 4, 1, 1620286038),
(28, 116, 4, 1, 1620797504),
(29, 114, 4, 1, 1621494319),
(30, 117, 4, 1, 1621407677),
(33, 119, 4, 1, 1624873487),
(34, 120, 4, 1, 1624873582),
(35, 121, 4, 1, 1624873583),
(36, 122, 4, 1, 1624873488),
(37, 123, 4, 1, 1624884498),
(38, 124, 4, 1, 1624877406),
(39, 126, 4, 1, 1623836018),
(40, 118, 4, 1, 1622028818),
(41, 132, 4, 1, 1626377628),
(42, 133, 4, 1, 1632740703),
(44, 129, 4, 1, 1639395167),
(45, 128, 4, 1, 1632993311),
(46, 135, 4, 1, 1628396977),
(48, 136, 4, 1, 1632917082),
(49, 137, 4, 1, 1643796214),
(50, 138, 4, 1, 1632737549),
(51, 139, 4, 1, 1632727201),
(52, 140, 4, 1, 1639388097),
(53, 141, 4, 1, 1638365095),
(55, 143, 4, 1, 1638966871),
(56, 144, 4, 1, 1639396650);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_exams`
--

CREATE TABLE `user_exams` (
  `id_user_course` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_exam` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `c_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `user_exams`
--

INSERT INTO `user_exams` (`id_user_course`, `id_user`, `id_exam`, `status`, `c_date`) VALUES
(2, 104, 1, 0, 1234324123);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_exams_session`
--

CREATE TABLE `user_exams_session` (
  `user_exams_session_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `id_answer` int(11) NOT NULL,
  `c_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `user_exams_session`
--

INSERT INTO `user_exams_session` (`user_exams_session_id`, `id_user`, `id_course`, `id_question`, `id_answer`, `c_date`) VALUES
(93, 101, 1, 1, 2, 1615449167),
(94, 101, 1, 2, 10, 1615449183),
(95, 101, 1, 3, 13, 1615449204),
(96, 101, 1, 4, 18, 1615449248),
(101, 107, 1, 1, 2, 1615882949),
(102, 107, 1, 2, 10, 1615882983),
(103, 107, 1, 3, 13, 1615882991),
(104, 107, 1, 4, 18, 1615883052),
(109, 105, 1, 1, 2, 1616074283),
(110, 105, 1, 2, 10, 1616074304),
(111, 105, 1, 3, 13, 1616074306),
(112, 105, 1, 4, 18, 1616074364),
(113, 108, 1, 1, 2, 1616161097),
(114, 108, 1, 2, 10, 1616161114),
(115, 108, 1, 3, 13, 1616161123),
(116, 108, 1, 4, 18, 1616161141),
(125, 112, 1, 1, 2, 1616581023),
(126, 112, 1, 2, 10, 1616581048),
(127, 112, 1, 3, 13, 1616581086),
(128, 112, 1, 4, 18, 1616581234),
(129, 111, 1, 1, 2, 1616581252),
(130, 111, 1, 2, 10, 1616581263),
(131, 111, 1, 3, 13, 1616581267),
(132, 111, 1, 4, 18, 1616581279),
(141, 115, 1, 1, 2, 1620285977),
(142, 115, 1, 2, 10, 1620286000),
(143, 115, 1, 3, 13, 1620286017),
(144, 115, 1, 4, 18, 1620286038),
(181, 116, 1, 1, 2, 1620797487),
(182, 116, 1, 2, 10, 1620797496),
(183, 116, 1, 3, 13, 1620797499),
(184, 116, 1, 4, 18, 1620797504),
(185, 117, 1, 1, 2, 1621407660),
(186, 117, 1, 2, 10, 1621407664),
(187, 117, 1, 3, 13, 1621407666),
(188, 117, 1, 4, 18, 1621407677),
(189, 113, 1, 1, 2, 1621494081),
(190, 114, 1, 1, 2, 1621494081),
(191, 113, 1, 2, 10, 1621494115),
(192, 114, 1, 2, 10, 1621494116),
(193, 113, 1, 3, 13, 1621494141),
(194, 114, 1, 3, 13, 1621494142),
(195, 113, 1, 4, 18, 1621494318),
(196, 114, 1, 4, 18, 1621494319),
(197, 109, 1, 1, 2, 1622544444),
(198, 109, 1, 2, 10, 1622544452),
(199, 109, 1, 3, 13, 1622544455),
(200, 109, 1, 4, 18, 1622544458),
(202, 122, 1, 1, 2, 1624873313),
(203, 119, 1, 1, 2, 1624873318),
(204, 119, 1, 2, 10, 1624873412),
(205, 122, 1, 2, 10, 1624873414),
(206, 119, 1, 3, 13, 1624873459),
(207, 122, 1, 3, 13, 1624873459),
(208, 119, 1, 4, 18, 1624873487),
(209, 122, 1, 4, 18, 1624873488),
(210, 120, 1, 1, 2, 1624873561),
(211, 121, 1, 1, 2, 1624873562),
(212, 121, 1, 2, 10, 1624873568),
(213, 120, 1, 2, 10, 1624873569),
(214, 121, 1, 3, 13, 1624873576),
(215, 120, 1, 3, 13, 1624873577),
(216, 120, 1, 4, 18, 1624873582),
(217, 121, 1, 4, 18, 1624873583),
(218, 124, 1, 1, 2, 1624877255),
(219, 124, 1, 2, 10, 1624877303),
(220, 124, 1, 3, 13, 1624877386),
(221, 124, 1, 4, 18, 1624877406),
(222, 123, 1, 1, 2, 1624884340),
(223, 123, 1, 2, 10, 1624884410),
(224, 123, 1, 3, 13, 1624884440),
(225, 123, 1, 4, 18, 1624884498),
(226, 126, 1, 1, 2, 1624957014),
(227, 126, 1, 2, 10, 1624957018),
(228, 126, 1, 3, 13, 1624957021),
(229, 126, 1, 4, 18, 1624957023),
(230, 118, 1, 1, 2, 1624959396),
(231, 118, 1, 2, 10, 1624959402),
(232, 118, 1, 3, 13, 1624959404),
(233, 118, 1, 4, 18, 1624959405),
(234, 110, 1, 1, 2, 1631614696),
(235, 110, 1, 2, 10, 1631614713),
(236, 110, 1, 3, 13, 1631614717),
(237, 110, 1, 4, 18, 1631614721),
(238, 132, 1, 1, 2, 1631377617),
(239, 132, 1, 2, 10, 1631377622),
(240, 132, 1, 3, 13, 1631377626),
(241, 132, 1, 4, 18, 1631377628),
(242, 135, 1, 1, 2, 1632396797),
(243, 135, 1, 2, 10, 1632396802),
(244, 135, 1, 3, 13, 1632396975),
(245, 135, 1, 4, 18, 1632396977),
(250, 139, 1, 1, 2, 1632727108),
(251, 139, 1, 2, 10, 1632727144),
(252, 139, 1, 3, 13, 1632727156),
(253, 139, 1, 4, 18, 1632727201),
(256, 138, 1, 1, 2, 1632737512),
(257, 138, 1, 2, 10, 1632737524),
(258, 138, 1, 3, 13, 1632737529),
(259, 138, 1, 4, 18, 1632737549),
(264, 133, 1, 1, 2, 1632740670),
(265, 133, 1, 2, 10, 1632740689),
(266, 133, 1, 3, 13, 1632740694),
(267, 133, 1, 4, 18, 1632740703),
(268, 136, 1, 1, 2, 1632916997),
(269, 136, 1, 2, 10, 1632917038),
(270, 136, 1, 3, 13, 1632917057),
(271, 136, 1, 4, 18, 1632917082),
(272, 128, 1, 1, 2, 1632993292),
(273, 128, 1, 2, 10, 1632993302),
(274, 128, 1, 3, 13, 1632993307),
(275, 128, 1, 4, 18, 1632993311),
(276, 141, 1, 1, 2, 1638365000),
(277, 141, 1, 2, 10, 1638365045),
(278, 141, 1, 3, 13, 1638365066),
(279, 141, 1, 4, 18, 1638365095),
(280, 143, 1, 1, 2, 1638966819),
(281, 143, 1, 2, 10, 1638966837),
(282, 143, 1, 3, 13, 1638966850),
(283, 143, 1, 4, 18, 1638966871),
(284, 140, 1, 1, 2, 1639387913),
(285, 140, 1, 2, 10, 1639387997),
(286, 140, 1, 3, 13, 1639388033),
(287, 140, 1, 4, 18, 1639388097),
(288, 129, 1, 1, 2, 1639395140),
(289, 129, 1, 2, 10, 1639395158),
(290, 129, 1, 3, 13, 1639395161),
(291, 129, 1, 4, 18, 1639395167),
(300, 144, 1, 1, 2, 1639396628),
(301, 144, 1, 2, 10, 1639396645),
(302, 144, 1, 3, 13, 1639396648),
(303, 144, 1, 4, 18, 1639396650),
(304, 137, 1, 1, 2, 1643796128),
(305, 137, 1, 2, 10, 1643796167),
(306, 137, 1, 3, 13, 1643796179),
(307, 137, 1, 4, 18, 1643796214);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id_answer`);

--
-- Indeksy dla tabeli `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id_attachment`);

--
-- Indeksy dla tabeli `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_course`);

--
-- Indeksy dla tabeli `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id_exam`);

--
-- Indeksy dla tabeli `exam_course`
--
ALTER TABLE `exam_course`
  ADD PRIMARY KEY (`id_exam_course`);

--
-- Indeksy dla tabeli `e_session`
--
ALTER TABLE `e_session`
  ADD PRIMARY KEY (`id_e_session`);

--
-- Indeksy dla tabeli `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id_lesson`);

--
-- Indeksy dla tabeli `lesson_course`
--
ALTER TABLE `lesson_course`
  ADD PRIMARY KEY (`id_lesson_course`);

--
-- Indeksy dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id_question`);

--
-- Indeksy dla tabeli `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id_section`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeksy dla tabeli `user_course`
--
ALTER TABLE `user_course`
  ADD PRIMARY KEY (`id_user_course`);

--
-- Indeksy dla tabeli `user_exams`
--
ALTER TABLE `user_exams`
  ADD PRIMARY KEY (`id_user_course`);

--
-- Indeksy dla tabeli `user_exams_session`
--
ALTER TABLE `user_exams_session`
  ADD PRIMARY KEY (`user_exams_session_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT dla tabeli `answers`
--
ALTER TABLE `answers`
  MODIFY `id_answer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id_attachment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `course`
--
ALTER TABLE `course`
  MODIFY `id_course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `exams`
--
ALTER TABLE `exams`
  MODIFY `id_exam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `exam_course`
--
ALTER TABLE `exam_course`
  MODIFY `id_exam_course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT dla tabeli `e_session`
--
ALTER TABLE `e_session`
  MODIFY `id_e_session` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id_lesson` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT dla tabeli `lesson_course`
--
ALTER TABLE `lesson_course`
  MODIFY `id_lesson_course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `questions`
--
ALTER TABLE `questions`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `sections`
--
ALTER TABLE `sections`
  MODIFY `id_section` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT dla tabeli `user_course`
--
ALTER TABLE `user_course`
  MODIFY `id_user_course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT dla tabeli `user_exams`
--
ALTER TABLE `user_exams`
  MODIFY `id_user_course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `user_exams_session`
--
ALTER TABLE `user_exams_session`
  MODIFY `user_exams_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
