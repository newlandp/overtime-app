import React from 'react';
import Truncate from 'react-truncate';

import StatusBadge from './status_badge';
import EditPostModal from './edit_post_modal';

// TODO: status label
export default class PostRow extends React.Component {
  constructor(props) {
    super(props);

    this.closeEditModal = this.closeEditModal.bind(this);
    this.openEditModal = this.openEditModal.bind(this);
    
    this.state = { showEditModal: false };
  }

  closeEditModal() {
    this.setState({ showEditModal: false });
  }

  openEditModal() {
    this.setState({ showEditModal: true });
  }

  render() {
    const { post } = this.props;

    return (
      <tr>

        <EditPostModal
          showModal={this.state.showEditModal}
          close={this.closeEditModal}
        />

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
        <td>
          <i className="icon-pencil index-icons"
             id={`edit_${post.id}`}
             onClick={this.openEditModal}>
          </i>
        </td>
        <td><a href={`/posts/${post.id}`} data-method="delete" className="icon-trash index-icons" id={`delete_post_${post.id}_from_index`}></a></td>
      </tr>
    );
  }
}

