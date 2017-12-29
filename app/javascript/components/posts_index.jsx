import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { fetchPosts } from '../actions/index';
import _ from 'lodash';
import ReactPaginate from 'react-paginate';
import { PAGINATION_RANGE } from '../constants';

import PostsTable from './posts_table';

class PostsIndex extends React.Component {
  constructor(props) {
    super(props);

    this.handlePaginationClick = this.handlePaginationClick.bind(this);

    this.state = {
      offset: 0
    };
  }

  componentDidMount() {
    this.props.fetchPosts(PAGINATION_RANGE, this.state.offset);
  }

  handlePaginationClick(data) {
    const offset = data.selected * PAGINATION_RANGE;

    this.setState({
      offset: offset
    }, () => {
      this.props.fetchPosts(PAGINATION_RANGE, this.state.offset);
    });
  }

  // TODO: style pagination
  render() {
    return (
      <div>
        <PostsTable posts={this.props.posts} />
        <ReactPaginate previousLabel={"Previous"}
                       nextLabel={"Next"}
                       breakLabel={<a href="">...</a>}
                       breakClassName={"break-me"}
                       pageCount={Math.ceil(this.props.totalPosts / PAGINATION_RANGE)}
                       marginPagesDisplayed={1}
                       pageRangeDisplayed={PAGINATION_RANGE}
                       onPageChange={this.handlePaginationClick}
                       containerClassName={"pagination"}
                       subContainerClassName={"pages pagination"}
                       activeClassName={"active clickable"}
                       pageClassName={"page-item clickable"}
                       pageLinkClassName={"page-link clickable"}
                       previousClassName={"page-item clickable"}
                       previousLinkClassName={"page-link clickable"}
                       nextClassName={"page-item clickable"}
                       nextLinkClassName={"page-link clickable"} />
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    posts: state.posts,
    totalPosts: state.totalPosts
  }
}

function mapStateToDispatch(dispatch) {
  return bindActionCreators({ fetchPosts: fetchPosts }, dispatch);
}

export default connect(mapStateToProps, mapStateToDispatch)(PostsIndex);