import * as React from 'react';
import { useState } from 'react';
import { redeemIncentives } from '@api/endpoints';
import classnames from 'classnames';

export const CandidateApp: React.FC = () => {
  const [redeemed, setRedeemed] = useState(false);
  const [loading, setLoading] = useState(false);
  const [hasErrors, setHasErrors] = useState(false);
  const [message, setMessage] = useState('');

  async function handleClickRedeem() {
    setLoading(true);
    redeemIncentives().then((data) => {
      setHasErrors(data.errors);
      setMessage(data.message);
      setRedeemed(true);
      setLoading(false);
    });
  }

  const messageClasses = classnames({
    'py-4 italic': true,
    'text-green-600': !hasErrors,
    'text-red-600': hasErrors,
  });

  const buttonClasses = classnames({
    'bg-gray-200 rounded-md px-4 py-2': true,
    'hover:bg-gray-100': !loading && !redeemed,
  });

  return (
    <div className="px-12 py-6">
      <h1 className="text-2xl font-bold mb-6">Redeem incentive</h1>
      <div className={messageClasses}>{message}</div>
      <button disabled={loading || redeemed} className={buttonClasses} onClick={handleClickRedeem}>
        Redeem
      </button>
    </div>
  );
};
