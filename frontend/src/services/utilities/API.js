import APICore from './Core';

const collectionsURL = 'collections';
const booksURL = 'books';
const containsURL = 'contains';
const accountURL = 'user';
const reviewsURL = 'reviews'
const profilesURL = 'auth/profiles';
const authorsURL = 'authors';
const writtenByURL = 'writtenby';
const goalURL = 'reading_goals';
const readsURL = 'reads';

export const apiReads = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: true,
    patch: true,
    remove: true,
    url: readsURL,
})

export const apiGoal = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: true,
    patch: true,
    remove: true,
    url: goalURL,
})

export const apiProfiles = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: true,
    patch: true,
    remove: true,
    url: profilesURL,
})

export const apiAccount = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: false,
    patch: true,
    remove: true,
    url: accountURL,  
});

export const apiCollections = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: true,
    patch: true,
    remove: true,
    url: collectionsURL,
});

export const apiBooks = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: false,
    patch: true,
    remove: true,
    url: booksURL,
});

export const apiContains = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: false,
    patch: true,
    remove: true,
    url: containsURL,
});

export const apiReviews = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: true,
    patch: true,
    remove: true,
    url: reviewsURL,
});

export const apiAuthors = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: true,
    patch: true,
    remove: true,
    url: authorsURL,
});

export const apiWrittenBy = new APICore({
    getAll: true,
    getSingle: true,
    post: true,
    put: true,
    patch: true,
    remove: true,
    url: writtenByURL,
});

export default apiCollections;