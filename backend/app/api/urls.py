from django.urls import path
from rest_framework.routers import DefaultRouter

from .views import (
    BooksSet,
    ReadsSet,
    ReviewsSet,
    AuthorsSet,
    WrittenBySet,
    CollectionsSet,
    ContainsSet
)

router = DefaultRouter()

router.register(r'books', BooksSet)
router.register(r'reads', ReadsSet)
router.register(r'reviews', ReviewsSet)
router.register(r'authors', AuthorsSet)
router.register(r'writtenby', WrittenBySet)
router.register(r'collections', CollectionsSet)
router.register(r'contains', ContainsSet)

urlpatterns = router.urls

