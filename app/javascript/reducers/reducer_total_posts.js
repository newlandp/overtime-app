import { FETCH_POSTS } from '../actions/action_types';

export default function(state = 0, action) {
  switch(action.type) {
    case FETCH_POSTS:
      return action.payload.data.total_count;
  }
  return state;
}