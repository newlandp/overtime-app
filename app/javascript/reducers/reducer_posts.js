import { FETCH_POSTS, DELETE_POST } from '../actions/action_types';
import _ from 'lodash';

export default function(state = {}, action) {
  switch(action.type) {
    case FETCH_POSTS:
      return _.mapKeys(action.payload.data.posts, 'id');
    case DELETE_POST:
      return _.omit(state, action.payload);
  }
  return state;
}