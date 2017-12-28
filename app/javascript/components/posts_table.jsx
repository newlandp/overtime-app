import React from 'react';

import PostRow from './post_row';

export default function PostsTable(props) {
  const posts = _.map(props.posts, post => {
    return <PostRow post={post} key={post.id} />;
  });

  return (
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
  );
}
