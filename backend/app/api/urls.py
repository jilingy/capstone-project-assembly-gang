from django.urls import path
from rest_framework.routers import DefaultRouter

from .views import (
    BooksSet,
    ReadsSet,
    ReviewsSet,
    AuthorsSet,
    WrittenBySet,
    CollectionsSet,
    ContainsSet,
    UserSet,
    ReadingGoalsSet,
    UpvotesSet
)

router = DefaultRouter()

router.register(r'reading_goals', ReadingGoalsSet, basename='reading_goals')
router.register(r'books', BooksSet, basename='books')
router.register(r'reads', ReadsSet, basename='reads')
router.register(r'reviews', ReviewsSet, basename='reviews')
router.register(r'authors', AuthorsSet, basename='authors')
router.register(r'writtenby', WrittenBySet, basename='writtenby')
router.register(r'collections', CollectionsSet, basename='collections')
router.register(r'contains', ContainsSet, basename='contains')
router.register(r'upvotes', UpvotesSet, basename='upvotes')
router.register(r'user', UserSet)

urlpatterns = router.urls

