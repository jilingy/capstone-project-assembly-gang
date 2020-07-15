import APIProvider from './Provider';

export default class APICore {
    
  constructor(options) {
      if (options.getAll) {
        this.getAll = () => {
          return APIProvider.getAll(options.url);
        };
      }
  
      if (options.getSingle) {
        this.getSingle = (id) => {
          return APIProvider.getSingle(options.url, id);
        };
      }
  
      if (options.post) {
        this.post = (model) => {
          return APIProvider.post(options.url, model);
        };
      }
  
      if (options.put) {
        this.put = (id, model) => {
          return APIProvider.put(options.url, id, model);
        };
      }
  
      if (options.patch) {
        this.patch = (id, model) => {
          return APIProvider.patch(options.url, id, model);
        };
      }
  
      if (options.remove) {
        this.remove = (id) => {
          return APIProvider.remove(options.url, id);
        };
      }
    }
}