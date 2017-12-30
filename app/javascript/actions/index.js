import axios from 'axios';
import { FETCH_POSTS, DELETE_POST, UPDATE_POST } from './action_types';

export function fetchPosts(maxPerPage, offset) {
  const response = axios.get('/posts_json', { params: {
                                                limit: maxPerPage,
                                                offset: offset
                                              }
                                            });

  return {
    type: FETCH_POSTS,
    payload: response
  };
}

export function deletePost(id) {
  const response = axios.delete(`/posts/${id}`);

  return {
    type: DELETE_POST,
    payload: id
  };
}

export function updatePost() {
  return {
    type: UPDATE_POST
  }
}