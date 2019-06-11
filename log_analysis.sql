CREATE VIEW pop_article AS
SELECT articles.title, count(log.path) as article_views
FROM articles, log
where concat('/article/', articles.slug) = log.path
AND log.path like '/article/%'
AND log.method = 'GET'
AND log.status = '200 OK'
GROUP BY articles.title
ORDER BY article_views DESC
limit 3;

CREATE VIEW pop_author AS
SELECT authors.name, sum(article_views) as author_views
FROM authors, articles, pop_article
WHERE authors.id = articles.author
GROUP BY authors.name
ORDER BY author_views DESC;

CREATE VIEW view_day AS
SELECT count(log.path), date_trunc('day', log.time) as day
FROM log
WHERE log.method = 'GET'
GROUP BY day;

CREATE VIEW error_day AS
SELECT count(log.path), date_trunc('day', log.time) as day
FROM log
WHERE log.status != '200 OK'
AND log.method = 'GET'
GROUP BY day;

CREATE VIEW error_over_1 AS
SELECT to_char(100*(cast(error_day.count as decimal)/view_day.count), '0.9%')
as error,
to_char(error_day.day, 'Month dd, yyyy') as day
FROM error_day, view_day
WHERE error_day.day = view_day.day
AND cast(error_day.count as decimal)/view_day.count >= 0.01
ORDER BY error DESC;
