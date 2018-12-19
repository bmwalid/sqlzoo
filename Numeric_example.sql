/*
2 Show the institution and subject where the score is at least 100 for question 15.
*/
select institution, subject from nss where score >= 100 and question = 'Q15';


/*
5
Show the subject and total number of students who
A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' 
and '(H) Creative Arts and Design'.
*/
Select subject, Sum((A_STRONGLY_AGREE/100) * response) from nss where question = 'Q22' and 
subject in ('(H) Creative Arts and Design','(8) Computer Science')  group by subject ;

/*
6
Show the percentage of students who A_STRONGLY_AGREE to question 22 for the 
subject '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.
*/
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE/100) / SUM(response) * 100,0) FROM nss
	WHERE question='Q22' AND
		(subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
			GROUP BY subject;

/*
8
Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.

The column score is a percentage - you must use the method outlined above to multiply the percentage by
the response and divide by the total response. Give your answer rounded to the nearest whole number.
*/
select institution, avg(score) from nss where (question = 'Q22' and institution LIKE '%Manchester%')
group by institution


/*
8
Show the institution, the total sample size and the number of computing students
for institutions in Manchester for 'Q01'.
*/
select total.institution,total_sample, computing_sample from 
(select a.institution, sum(sample) as total_sample from nss a where institution like '%Manchester%' and
question='Q01' group by a.institution ) total 
join 
( select a.institution, sum(sample) as computing_sample from nss a where institution like '%Manchester%' and
question='Q01' and subject like '%comput%' group by a.institution) comput 
on 
(total.institution = comput.institution)


/*

*/
/*

*/
/*

*/
/*

*/
/*

*/
