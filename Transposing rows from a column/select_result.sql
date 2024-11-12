select f.id
  , f.recipe
  , right(s.recipe,len(s.recipe)-3) as '1st Ingredient'
  , right(ss.recipe,len(ss.recipe)-3) as '2nd Ingredient'
  , right(sss.recipe,len(sss.recipe)-3) as '3rd Ingredient'  
from Food f
left join (select id, recipe from Food where recipe like '1%') s on s.id=f.id
left join (select id, recipe from Food where recipe like '2%') ss on ss.id=f.id
left join (select id, recipe from Food where recipe like '3%') sss on sss.id=f.id
where f.recipe like 'Name%';
