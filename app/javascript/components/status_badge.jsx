import React from 'react';

import { capitalize } from '../helpers';

export default function StatusBadge(props) {
  switch(props.status) {
    case 'submitted':
      return <span className="badge badge-primary">{capitalize(props.status)}</span>;
    case 'approved':
      return <span className="badge badge-success">{capitalize(props.status)}</span>;
    case 'rejected':
      return <span className="badge badge-danger">{capitalize(props.status)}</span>;
    case 'pending':
      return <span className="badge badge-primary">{capitalize(props.status)}</span>;
    case 'confirmed':
      return <span className="badge badge-success">{capitalize(props.status)}</span>;
  }
  return <span>{props.status}</span>;
}
