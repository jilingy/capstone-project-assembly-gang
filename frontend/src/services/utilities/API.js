import APICore from './Core';

const collectionsURL = 'collections';
const booksURL = 'books';
const containsURL = 'contains';
const accountURL = 'user';

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

export default apiCollections;