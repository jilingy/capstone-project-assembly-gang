from django.db import models
from django.core.validators import RegexValidator
from django.utils import timezone
from datetime import datetime, date
from django.contrib.auth.models import User
from simple_email_confirmation.models import SimpleEmailConfirmationUserMixin

class Books(models.Model):

    class Meta:
        db_table = 'books'

    ACTION     = 'Action' 
    ADVENTURE  = 'Adventure'
    CHILDRENS  = 'Childrens'
    CLASSIC    = 'Classic'
    COMIC      = 'Comic'
    CRIME      = 'Crime'
    DRAMA      = 'Drama'
    FANTASY    = 'Fantasy'
    HORROR     = 'Horror'
    MYSTERY    = 'Mystery'
    POETRY     = 'Poetry'
    SCIFI      = 'Scifi'
    SUSPENSE   = 'Suspense'
    THRILLER   = 'Thriller'
    HUMOR      = 'Humor'
    RELIGION   = 'Religion'
    PHILOSOPHY = 'Philosphy'
    TEXTBOOK   = 'Textbook'
    TRAVEL     = 'Travel'
    SPORTS     = 'Sports'

    GENRES = [
        (ACTION     , 'ACTION'),
        (ADVENTURE  , 'ADVENTURE'),
        (CHILDRENS  , 'CHILDRENS'),
        (CLASSIC    , 'CLASSIC'),
        (COMIC      , 'COMIC'),
        (CRIME      , 'CRIME'),
        (DRAMA      , 'DRAMA'),
        (FANTASY    , 'FANTASY'),
        (HORROR     , 'HORROR'),
        (MYSTERY    , 'MYSTERY'),
        (POETRY     , 'POETRY'),
        (SCIFI      , 'SCIFI'),
        (SUSPENSE   , 'SUSPENSE'),
        (THRILLER   , 'THRILLER'),
        (HUMOR      , 'HUMOR'),
        (RELIGION   , 'RELIGION'),
        (PHILOSOPHY , 'PHILOSOPHY'),
        (TEXTBOOK   , 'TEXTBOOK'),
        (TRAVEL     , 'TRAVEL'),
        (SPORTS     , 'SPORTS'),
    ]

    book_title = models.CharField(max_length=200, default="book_title")
    book_synopsis = models.TextField(default="default_book_synopsis")
    book_publisher = models.CharField(max_length=200, default="default_publisher")
    publication_date = models.DateField(default=date.today)
    genre = models.CharField(max_length=50, choices=GENRES, default=ADVENTURE)
    book_thumbnail = models.CharField(max_length=200, default="book_thumbnail")
    average_rating = models.FloatField(default=0.0)

class Reads(models.Model):

    class Meta:
        db_table = 'reads'

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="reader")
    book = models.ForeignKey(Books, on_delete=models.CASCADE, related_name="read_by")

class Reviews(models.Model):

    class Meta:
        db_table = 'reviews'

    RATINGS = [
        (1 , '1_STAR'),
        (2 , '2_STAR'),
        (3 , '3_STAR'),
        (4 , '4_STAR'),
        (5 , '5_STAR'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="by_user")
    book = models.ForeignKey(Books, on_delete=models.CASCADE, related_name="for_book")
    review = models.TextField(blank=True, default="default_review_text")
    rating = models.IntegerField(blank=False, choices=RATINGS)
    date = models.DateField(default=date.today)

class Authors(models.Model):

    class Meta:
        db_table = 'authors'
    
    author_name = models.CharField(max_length=200, default="author_name")

class WrittenBy(models.Model):

    class Meta:
        db_table = 'written_by'

    book   = models.ForeignKey(Books, on_delete=models.CASCADE, related_name="written_by")
    author = models.ForeignKey(Authors, on_delete=models.CASCADE, related_name="books")

class Collections(models.Model):

    class Meta:
        db_table = 'collection'

    MAIN  = 'Main'
    NAMED = 'Named'
    FINISHED = 'Finished'
    CLONED = 'Cloned'

    COLLECTION_TYPES = [
        (MAIN , 'MAIN'),
        (NAMED, 'NAMED'),
        (FINISHED, 'FINISHED'),
        (CLONED, 'CLONED')
    ]

    collection_type = models.CharField(max_length=10, choices=COLLECTION_TYPES, default=MAIN)
    is_private = models.BooleanField(default=False)
    description = models.TextField(default="collection_description")
    collection_name = models.CharField(max_length=200, default="default_collection_name")
    owner = models.ForeignKey(User, related_name="collection_list", on_delete=models.CASCADE, null=True)
    count = models.IntegerField(default=0)
    date_created = models.DateTimeField(default=datetime.now)

class Contains(models.Model):

    class Meta:
        db_table = 'contains'
    
    collection = models.ForeignKey(Collections, on_delete=models.CASCADE, related_name="contains")
    book = models.ForeignKey(Books, on_delete=models.CASCADE, related_name="within")
    time_added = models.DateTimeField(default=datetime.now)


class Profiles(SimpleEmailConfirmationUserMixin, models.Model):

    class Meta:
        db_table = 'profiles'
            
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    verification_code = models.CharField(max_length=100, default="XYZ")

