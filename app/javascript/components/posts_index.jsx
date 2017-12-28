import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { fetchPosts } from '../actions/index';
import _ from 'lodash';
import ReactPaginate from 'react-paginate';

import PostsTable from './posts_table';

const range = 5;

class PostsIndex extends React.Component {
  constructor(props) {
    super(props);

    this.handlePageClick = this.handlePageClick.bind(this);

    this.state = {
      offset: 0
    };
  }

  componentDidMount() {
    this.props.fetchPosts(range, this.state.offset);
  }

  handlePageClick(data) {
    this.setState({
      offset: (data.selected * range)
    }, () => {
      this.props.fetchPosts(range, this.state.offset);
    });
  }

  render() {
    console.log(this.state.offset);
    return (
      <div>
        <PostsTable posts={this.props.posts} />
        <ReactPaginate previousLabel={"previous"}
                       nextLabel={"next"}
                       breakLabel={<a href="">...</a>}
                       breakClassName={"break-me"}
                       pageCount={Math.ceil(this.props.totalPosts / range)}
                       marginPagesDisplayed={1}
                       pageRangeDisplayed={range}
                       onPageChange={this.handlePageClick}
                       containerClassName={"pagination"}
                       subContainerClassName={"pages pagination"}
                       activeClassName={"active"} />
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