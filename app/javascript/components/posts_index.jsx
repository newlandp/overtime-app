import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { fetchPosts } from '../actions/index';
import _ from 'lodash';

import PostRow from './post_row';

class PostsIndex extends React.Component {
  componentDidMount() {
    this.props.fetchPosts();
  }

  render() {
    const posts = _.map(this.props.posts, post => {
      return <PostRow post={post} key={post.id} />;
    });

    return (
      <div>
        <table className="table table-hover">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Overtime Requested</th>
              <th scope="col">Date</th>
              <th scope="col">User</th>
              <th scope="col">Rationale</th>
              <th scope="col">Status</th>
              <th scope="col"></th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody id="posts">
            {posts}
          </tbody>
        </table>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    posts: state.posts
  }
}

function mapStateToDispatch(dispatch) {
  return bindActionCreators({ fetchPosts: fetchPosts }, dispatch);
}

export default connect(mapStateToProps, mapStateToDispatch)(PostsIndex);