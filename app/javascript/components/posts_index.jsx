import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { fetchPosts } from '../actions/index';
import _ from 'lodash';

class PostsIndex extends React.Component {
  componentDidMount() {
    this.props.fetchPosts();
  }

  render() {
    const posts = _.map(this.props.posts, post => {
      return (
        <div key={post.id}>
          <div>
            {post.rationale}
          </div>
          <br />
        </div>
      );
    });

    return (
      <div>
        {posts}
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