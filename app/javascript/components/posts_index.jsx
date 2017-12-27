import React from 'react';
import { connect } from 'react-redux';

class PostsIndex extends React.Component {
  render() {
    return (
      <div>
        PostsIndex
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    posts: state.posts
  }
}

export default connect(mapStateToProps)(PostsIndex);