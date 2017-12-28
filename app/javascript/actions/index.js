import axios from 'axios';
import { FETCH_POSTS } from './action_types';

export function fetchPosts() {
  console.log('in the action creator');
  const response = axios.get('/posts_json');

  return {
    type: FETCH_POSTS,
    payload: response
  };
}