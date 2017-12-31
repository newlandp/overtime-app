import React from 'react';
import { Modal, Button } from 'react-bootstrap';
import { reduxForm, Field } from 'redux-form';
import { connect } from 'react-redux';
import { updatePost } from '../actions/index';

class EditPostModal extends React.Component {
  constructor(props) {
    super(props);
  }

  renderField(field) {
    const reduxFormField = `form-control mini-field ${field.meta.touched && field.meta.error ? 'is-invalid' : ''}`;
    return(
      <div className="form-group">
        <label>{field.label}</label>
        <input
          className={reduxFormField}
          type={field.fieldType}
          { ...field.input }
        />
        <div className="invalid-feedback">
          { field.meta.touched ? field.meta.error : "" }
        </div>
      </div>
    );
  }

  renderTextarea(field) {
    const reduxFormField = `form-control ${field.meta.touched && field.meta.error ? 'is-invalid' : ''}`;
    return(
      <div className="form-group">
        <label>{field.label}</label>
        <textarea
          rows="10"
          columns="50"
          className={reduxFormField}
          { ...field.input }
        ></textarea>
        <div className="invalid-feedback">
          { field.meta.touched ? field.meta.error : "" }
        </div>
      </div>
    );
  }

  onFormSubmit(values) {
    this.props.updatePost(this.props.id, values, () => {
      this.props.close();
    });
  }

  render() {
    return (
      <Modal show={this.props.showModal} onHide={this.props.close}>
        <form onSubmit={ this.props.handleSubmit(this.onFormSubmit.bind(this)) }>
          <Modal.Body>
            <h4>Edit Post</h4>
              <Field
                name="overtime_request"
                component={this.renderField}
                label="Overtime Request"
                fieldType="number"
              />
              <Field
                name="date"
                component={this.renderField}
                label="Date"
                fieldType="date"
              />
              <Field
                name="rationale"
                component={this.renderTextarea}
                label="Rationale"
              />
            
          </Modal.Body>
          <Modal.Footer>
            <button className="btn btn-primary" type="submit">
              Submit
            </button>
            <button onClick={this.props.close} type="button" className="btn btn-secondary">
              Close
            </button>
          </Modal.Footer>
        </form>
      </Modal>
    );
  }
}

function validate(values) {
  const errors = {};

  if(!values.overtime_request || values.overtime_request <= 0) {
    errors.title = "need to request a time greater than zero"
  }

  if(!values.date) {
    errors.content = "need to include a date"
  }

  if(!values.rationale) {
    errors.content = "need to include a rationale"
  }

  return errors;
}

function mapStateToProps(state, ownProps) {
  return {
    post: state.posts[ownProps.id]
  };
}

export default connect(mapStateToProps, { updatePost })(reduxForm({
  validate,
  form: "EditPostModal"
})(EditPostModal));
