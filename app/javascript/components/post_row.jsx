import React from 'react';
import Truncate from 'react-truncate';

import StatusBadge from './status_badge';

// TODO: status label
export default function PostRow(props) {
  const { post } = props;
  return (
    <tr>
      <th scope="row">{post.id}</th>
      <td>{post.overtime_request}</td>
      <td>{post.date}</td>
      <td>{`${post.user.last_name.toUpperCase()}, ${post.user.first_name.toUpperCase()}`}</td>
      <td>
        <Truncate lines={1} ellipsis={<span>... <a href={`posts/${post.id}`}>Read more</a></span>}>
          <a href={`/posts/${post.id}`}>{post.rationale}</a>
        </Truncate>
      </td>
      <td><StatusBadge status={post.status} /></td>
      <td><a href={`/posts/${post.id}/edit`} className="icon-pencil index-icons" id={`edit_${post.id}`}></a></td>
      <td><a href={`/post/${post.id}`} data-method="delete" className="icon-trash index-icons" id={`delete_post_${post.id}_from_index`}></a></td>
    </tr>
  );
}

