import { combineReducers } from 'redux';
import PostsReducer from './reducer_posts'
import TotalPostsReducer from './reducer_total_posts'
import { reducer as formReducer } from 'redux-form';

const rootReducer = combineReducers({
  posts: PostsReducer,
  totalPosts: TotalPostsReducer,
  form: formReducer
});

export default rootReducer;