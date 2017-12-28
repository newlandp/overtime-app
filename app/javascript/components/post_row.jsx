import React from 'react';
import Truncate from 'react-truncate';

export default function PostRow(props) {
  const { post } = props;
  return (
    <tr>
      <th scope="row">{props.post.id}</th>
      <td>{post.overtime_request}</td>
      <td>{post.date}</td>
      <td>{post.user_id}</td>
      <td>
        <Truncate lines={2} ellipsis={<span>... <a href={`posts/${post.id}`}>Read more</a></span>}>
          <a href={`/posts/${post.id}`}>{post.rationale}</a>
        </Truncate>
      </td>
      <td>{post.status}</td>
      <td><a href={`/posts/${post.id}/edit`} className="icon-pencil index-icons" id={`edit_${post.id}`}></a></td>
      <td><a href={`/post/${post.id}`} data-method="delete" className="icon-trash index-icons" id={`delete_post_${post.id}_from_index`}></a></td>
    </tr>
  );
}

