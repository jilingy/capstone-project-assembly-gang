from rest_framework import viewsets, permissions

from app.models import (
    Books,
    Reads,
    Reviews,
    Authors,
    WrittenBy,
    Collections,
    Contains
)

from .serializers import (
    BookSerializer,
    ReadSerializer,
    ReviewSerializer,
    AuthorSerializer,
    WrittenBySerializer,
    CollectionSerializer,
    ContainSerializer
)

class BooksSet(viewsets.ModelViewSet):
    serializer_class = BookSerializer
    queryset = Books.objects.all()

class ReadsSet(viewsets.ModelViewSet):
    serializer_class = ReadSerializer
    queryset = Reads.objects.all()

class ReviewsSet(viewsets.ModelViewSet):
    serializer_class = ReviewSerializer
    queryset = Reviews.objects.all()

class AuthorsSet(viewsets.ModelViewSet):
    serializer_class = AuthorSerializer
    queryset = Authors.objects.all()

class WrittenBySet(viewsets.ModelViewSet):
    serializer_class = WrittenBySerializer
    queryset = WrittenBy.objects.all()

class CollectionsSet(viewsets.ModelViewSet):
    serializer_class = CollectionSerializer
    queryset = Collections.objects.all()

class ContainsSet(viewsets.ModelViewSet):
    serializer_class = ContainSerializer
    queryset = Contains.objects.all()





