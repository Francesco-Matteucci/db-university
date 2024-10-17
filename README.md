# Esercizio SQL - Database Universitario

## Descrizione

Questo progetto è un esercizio SQL volto a praticare l'uso di operazioni avanzate come `JOIN`, `GROUP BY` e funzioni di aggregazione. Ho eseguito diverse query su un database universitario che contiene informazioni su studenti, corsi, esami, dipartimenti e insegnanti. Le query sono state progettate per rispondere a specifiche richieste, migliorando al contempo la chiarezza e leggibilità dei risultati attraverso alias e ordinamenti appropriati.

### Tabelle Coinvolte:
- **students**: Contiene informazioni sugli studenti (nome, cognome, data di nascita, matricola, ecc.).
- **degrees**: Contiene i corsi di laurea e il dipartimento associato.
- **departments**: Contiene informazioni sui dipartimenti dell'università.
- **teachers**: Contiene informazioni sugli insegnanti (nome, cognome, indirizzo ufficio, ecc.).
- **exams**: Contiene informazioni sugli appelli d'esame (data, ora, corso associato, ecc.).
- **exam_student**: Raccoglie i voti degli studenti per ogni appello d'esame.

## Query Svolte

### File `queries-join.sql`
1. **Selezionare gli studenti iscritti al Corso di Laurea in Economia**  
   Ho utilizzato una `JOIN` tra le tabelle `students` e `degrees` per ottenere una lista degli studenti iscritti al corso di laurea in economia.

2. **Selezionare i corsi di laurea magistrale nel Dipartimento di Neuroscienze**  
   Questa query ha utilizzato una `JOIN` tra `degrees` e `departments` per contare i corsi magistrali nel dipartimento di neuroscienze.

3. **Selezionare tutti i corsi in cui insegna Fulvio Amato**  
   Con una `JOIN` tra `courses`, `teachers` e `course_teacher`, ho ottenuto i corsi insegnati dal docente specifico.

4. **Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome**  
   Una query con `JOIN` che mostra tutti gli studenti insieme ai loro corsi di laurea e dipartimenti, ordinati per cognome e nome.

5. **Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti**  
   Una query che collega i corsi di laurea con gli insegnanti che li insegnano, usando `JOIN` tra le tabelle `degrees`, `courses`, `course_teacher` e `teachers`.

6. **Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica**  
   Ho utilizzato `JOIN` per ottenere tutti i docenti che insegnano corsi nel Dipartimento di Matematica.

7. **Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18**  
   Una query che utilizza `GROUP BY` per contare i tentativi di esame di ciascun studente e visualizzare il voto massimo.

### File `queries-group-by.sql`
1. **Contare quanti iscritti ci sono stati ogni anno**  
   Una query che conta quanti studenti si sono iscritti per ogni anno utilizzando la funzione `YEAR()` e `GROUP BY`.

2. **Contare gli insegnanti che hanno l'ufficio nello stesso edificio**  
   Utilizza la colonna `office_address` per contare quanti insegnanti condividono lo stesso indirizzo d'ufficio.

3. **Calcolare la media dei voti di ogni appello d'esame**  
   Utilizza `AVG()` per calcolare la media dei voti per ciascun appello d'esame.

4. **Contare quanti corsi di laurea ci sono per ogni dipartimento**  
   Conta il numero di corsi di laurea per ogni dipartimento utilizzando `GROUP BY` sulla tabella `departments`.

## Utilizzo

1. Clona la repository.
2. Importa il database SQL fornito in un ambiente come **phpMyAdmin**.
3. Esegui le query contenute nei file `.sql` per visualizzare i risultati richiesti.

## Struttura del Repository

- `queries.sql`: Contiene le query eseguite nell'esercizio precedente, per prendere familiarità con il linguaggio.
- `queries-join.sql`: Contiene le query che fanno uso di `JOIN`.
- `queries-group-by.sql`: Contiene le query che fanno uso di `GROUP BY`.

