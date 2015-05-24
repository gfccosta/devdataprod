select md5(a.matricula) as id, a.cr, coalesce(a.saida,'') as Saida,
	if(a.CursoNome='Bacharelado Interdisciplinar em Ciência e Tecnologia', 'Science and Technology',
	if(a.CursoNome='Bacharelado Interdisciplinar em Saúde', 'Health',
	if(a.CursoNome='Bacharelado Interdisciplinar em Humanidades', 'Humanities',
	if(a.CursoNome='Bacharelado Interdisciplinar em Artes', 'Arts','?')))) as course, 
	(select count(*) from HistoricoCC h where h.matricula=a.matricula) as quant
from alunos a

select Count(matricula) as count, left(a.ingressoSemestre,4)  as year,
	if(a.CursoNome='Bacharelado Interdisciplinar em Ciência e Tecnologia', 'Science and Technology',
	if(a.CursoNome='Bacharelado Interdisciplinar em Saúde', 'Health',
	if(a.CursoNome='Bacharelado Interdisciplinar em Humanidades', 'Humanities',
	if(a.CursoNome='Bacharelado Interdisciplinar em Artes', 'Arts','?')))) as course,
	if(a.saida is null, 'active','innactive') as status
from alunos a 
where a.saida is null or a.saida <> a.ingressoSemestre
group by a.CursoNome, left(a.ingressoSemestre,4), if(a.saida is null, 'active','innactive') 


select Count(*) as count, h.semestreAno  as yearSemester,
	if(a.CursoNome='Bacharelado Interdisciplinar em Ciência e Tecnologia', 'Science and Technology',
	if(a.CursoNome='Bacharelado Interdisciplinar em Saúde', 'Health',
	if(a.CursoNome='Bacharelado Interdisciplinar em Humanidades', 'Humanities',
	if(a.CursoNome='Bacharelado Interdisciplinar em Artes', 'Arts','?')))) as course,
	if(a.saida is null, 'active','innactive') as status
from alunos a inner join historicocc h on h.matricula=a.matricula
where a.saida is null or a.saida <> a.ingressoSemestre
group by a.CursoNome, h.semestreAno, if(a.saida is null, 'active','innactive')