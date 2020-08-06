import axios from 'axios';
import { handleResponse, handleError } from './Response';

const BASE_URL = 'http://127.0.0.1:8000/api';

const getAll = (resource) => {
    return axios
        .get(`${BASE_URL}/${resource}`)
};

const getSingle = (resource, id) => {
    return axios
        .get(`${BASE_URL}/${resource}/${id}`)
};

const post = (resource, model) => { 
    return axios 
      .post(`${BASE_URL}/${resource}/`, model) 
}; 

const put = (resource, id, model) => { 
    return axios 
      .put(`${BASE_URL}/${resource}/${id}/`, model) 
};

const patch = (resource, id, model) => { 
    return axios 
        .patch(`${BASE_URL}/${resource}/${id}/`, model)  
};

const remove = (resource, id) => { 
    return axios 
      .delete(`${BASE_URL}/${resource}/${id}/`) 
}; 



const APIProvider = { 
    getAll, 
    getSingle, 
    post, 
    put, 
    patch, 
    remove, 
};

export default APIProvider;