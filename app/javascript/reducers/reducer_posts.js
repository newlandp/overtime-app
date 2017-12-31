import { FETCH_POSTS, DELETE_POST, UPDATE_POST } from '../actions/action_types';
import _ from 'lodash';

export default function(state = {}, action) {
  switch(action.type) {
    case FETCH_POSTS:
      return _.mapKeys(action.payload.data.posts, 'id');
    case DELETE_POST:
      return _.omit(state, action.payload);
    case UPDATE_POST:
      console.log(action.payload);
      return { ...state, [action.payload.data.id]: action.payload.data };
  }
  return state;
}