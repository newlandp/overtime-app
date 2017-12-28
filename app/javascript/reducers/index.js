import { combineReducers } from 'redux';
import PostsReducer from './reducer_posts'
import TotalPostsReducer from './reducer_total_posts'

const rootReducer = combineReducers({
  posts: PostsReducer,
  totalPosts: TotalPostsReducer
});

export default rootReducer;