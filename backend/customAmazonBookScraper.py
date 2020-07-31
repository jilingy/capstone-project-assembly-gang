from psycopg2 import connect
import requests
import json
from imgscrape import imgscrape
import datetime

URL = 'https://api.nytimes.com/svc/books/v3/lists.json?list=young-adult-hardcover&api-key=Ly6oG7blBi7pwEcKjxqH5O0euRQG2z92'
REQUESTHEADERS = {
	"Accept": "application/json"
}
CHROMEDRIVER='/home/farhanghazi97/Downloads/chromedriver'

if __name__ == "__main__":
	try:
		conn = connect(
			host="localhost", 
			database="3900proj", 
			user="3900user", 
			password="Z00k33p3r123"
		)
		cur = conn.cursor()
		request = requests.get(URL, headers=REQUESTHEADERS)
		obj = json.loads(request.content)
		for book in obj['results']:
			
			date = datetime.datetime.strptime(book['published_date'], "%Y-%m-%d").date()
			bookThumbnailURL = imgscrape(book["amazon_product_url"], path=CHROMEDRIVER)
			bookObj   = book['book_details'][0]
			title 	  = bookObj['title']
			desc 	  = bookObj['description']
			publisher = bookObj['publisher']
			author 	  = bookObj['author']

			book_insert_query = """ 
									INSERT INTO books (book_title, book_synopsis, book_publisher, publication_date, genre, average_rating, book_thumbnail) 
									VALUES (%s,%s,%s,%s,%s,%s,%s) RETURNING id;
								"""
			book_to_insert = (title, desc, publisher, date, "Crime", 0, bookThumbnailURL[0])

			cur.execute(book_insert_query, book_to_insert)
			bookID = cur.fetchone()[0]

			conn.commit()
			count = cur.rowcount
			print (count, "Book inserted successfully into books table")

			author_insert_query = """ 
									INSERT INTO authors (author_name)
									VALUES (%s) RETURNING id;
								  """

			author_to_insert = (author, )

			cur.execute(author_insert_query, author_to_insert)
			authorID = cur.fetchone()[0]

			conn.commit()
			count = cur.rowcount
			print(count, "Author inserted successfully into authors table")

			writtenby_insert_query = """ INSERT INTO written_by (author_id, book_id)
										 VALUES (%s,%s);
									 """ 

			writtenby_to_insert = (authorID, bookID)

			cur.execute(writtenby_insert_query, writtenby_to_insert)

			conn.commit()
			count = cur.rowcount
			print(count, "WrittenBy inserted successfully into authors table")

	except (Exception, psycopg2.DatabaseError) as error:
		print(error)
	finally:
		if conn is not None:
			conn.close()
			print('Database connection closed.')
