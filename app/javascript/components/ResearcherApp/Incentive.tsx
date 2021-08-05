import * as React from 'react';
import { useState } from 'react';
import classnames from 'classnames';

interface Props {
  incentive: Incentive;
  handleEdit: any;
}

export const Incentive: React.FC<Props> = ({ incentive, handleEdit }) => {
  const statusClasses = classnames({
    'ml-2 px-2 inline-flex text-xs leading-5 font-semibold rounded-full': true,
    'bg-green-100 text-green-800': !incentive.redeemed,
    'bg-red-100 text-red-800': incentive.redeemed,
  });

  return (
    <li id={`incentive-${incentive.id}`} className="px-3 py-2">
      {incentive.code}
      <span className={statusClasses}>{incentive.redeemed ? 'redeemed' : 'available'}</span>
      <a
        href={`/incentives/${incentive.id}/edit`}
        className="text-xs ml-2 text-gray-500"
        onClick={handleEdit}
      >
        edit
      </a>
    </li>
  );
};
