import axios from 'axios';
import { FETCH_POSTS } from './action_types';

export function fetchPosts(maxPerPage, offset) {
  const response = axios.get('/posts_json', {
                                              params: {
                                                limit: maxPerPage,
                                                offset: offset
                                              }
                                            });

  return {
    type: FETCH_POSTS,
    payload: response
  };
}