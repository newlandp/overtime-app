import { FETCH_POSTS } from '../actions/action_types';
import _ from 'lodash';

export default function(state = {}, action) {
  switch(action.type) {
    case FETCH_POSTS:
      return _.mapKeys(action.payload.data.posts, 'id');
  }
  return state;
}