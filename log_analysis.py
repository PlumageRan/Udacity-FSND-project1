#!/usr/bin/env python3

import psycopg2


def connect():
    """Connect to the PostgreSQL database. Returns a database connection."""
    try:
        return psycopg2.connect("dbname=news")
    except psycopg2.Error:
        pass


def runQuery():
    '''Generate the report.'''
    print('Running queries...')
    print
    db = connect()
    c = db.cursor()
    print("Most popular three articles of all time:")
    c.execute("select * from pop_article;")
    pop_article = c.fetchall()
    for title, article_views in pop_article:
        print('"{}" - {} views'.format(title, article_views))
    print
    print("Most popular article authors of all time:")
    c.execute("select * from pop_author;")
    pop_author = c.fetchall()
    for name, author_views in pop_author:
        print('{} - {} views'.format(name, author_views))
    print
    print("The day more than 1% of requests lead to errors:")
    c.execute("select * from error_over_1")
    error_over_1 = c.fetchall()
    for error, day in error_over_1:
        print('{} - {} errors'.format(day, error))


if __name__ == "__main__":
    runQuery()
