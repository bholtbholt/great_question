import * as React from 'react';
import { useState, useCallback } from 'react';
import { IncentiveUpdate } from './IncentiveUpdate';
import { Incentive } from './Incentive';

interface Props {
  incentive: Incentive;
}

export const IncentiveListItem: React.FC<Props> = ({ incentive: initIncentive }) => {
  const [editing, setEditing] = useState(false);
  const [incentive, setIncentive] = useState(initIncentive);

  function handleEdit(event) {
    event.preventDefault();
    setEditing(true);
  }

  function handleCancel(event) {
    event.preventDefault();
    setEditing(false);
  }

  function handleSubmit(updatedIncentive) {
    setEditing(false);
    setIncentive(updatedIncentive);
  }

  return editing ? (
    <IncentiveUpdate incentive={incentive} handleCancel={handleCancel} afterSubmit={handleSubmit} />
  ) : (
    <Incentive incentive={incentive} handleEdit={handleEdit} />
  );
};
