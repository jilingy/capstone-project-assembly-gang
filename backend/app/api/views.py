from rest_framework import viewsets, status
from django.contrib.auth.models import User
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from django.http import Http404

from app.models import (
    Books,
    Reads,
    Reviews,
    Authors,
    WrittenBy,
    Collections,
    Contains,
    Profiles
)

from .serializers import (
    BookSerializer,
    ReadSerializer,
    ReviewSerializer,
    AuthorSerializer,
    WrittenBySerializer,
    CollectionSerializer,
    ContainSerializer,
)

class BooksSet(viewsets.ModelViewSet):
    
    serializer_class = BookSerializer
    queryset = Books.objects.all()
    def list(self, request, pk=None):
        books = Books.objects.all()
        serializer = BookSerializer(books, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        queryset = Books.objects.all()
        book = get_object_or_404(queryset, pk=pk)
        serializer = BookSerializer(book)
        return Response(serializer.data)

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

    def list(self, request, pk=None):
        collections = Collections.objects.all()
        serializer = CollectionSerializer(collections, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        queryset = Collections.objects.all()
        collection = get_object_or_404(queryset, pk=pk)
        serializer = CollectionSerializer(collection)
        return Response(serializer.data)

    def create(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(
            serializer.data, 
            status=status.HTTP_201_CREATED, 
            headers=headers
        )

    def destroy(self, request, pk=None):
        try:
            instance = self.get_object()
            self.perform_destroy(instance)
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        return Response(status=status.HTTP_200_OK)

class ContainsSet(viewsets.ModelViewSet):
   
    serializer_class = ContainSerializer
    queryset = Contains.objects.all()

    def list(self, request, pk=None):
        contains = Contains.objects.all()
        serializer = ContainSerializer(contains, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        queryset = Contains.objects.all()
        contain = get_object_or_404(queryset, pk=pk)
        serializer = ContainSerializer(contain)
        return Response(serializer.data)

    def create(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(
            serializer.data, 
            status=status.HTTP_201_CREATED, 
            headers=headers
        )

    def destroy(self, request, pk=None):
        try:
            instance = self.get_object()
            self.perform_destroy(instance)
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        return Response(status=status.HTTP_200_OK)


