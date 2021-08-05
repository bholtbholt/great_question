import * as React from 'react';
import { useState } from 'react';
import { createIncentive } from '@api/endpoints';

interface Props {
  addIncentive: any;
}

export const IncentiveNew: React.FC<Props> = ({ addIncentive }) => {
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState('');
  const [inputCode, setInputCode] = useState('');

  async function handleSubmit(event) {
    event.preventDefault();
    setSaving(true);
    createIncentive({ code: inputCode }).then((data) => {
      setSaving(false);
      setMessage(data.message);
      setTimeout(() => setMessage(''), 2000);
      if (data.incentive) {
        addIncentive(data.incentive);
        setInputCode('');
      }
    });
  }

  return (
    <form className="flex space-x-2 pb-4" onSubmit={handleSubmit}>
      <input
        disabled={saving}
        className="text-xl border px-2"
        type="text"
        name="incentive[code]"
        value={inputCode}
        onChange={(e) => setInputCode(e.currentTarget.value)}
      />
      <button disabled={saving} className="hover:bg-gray-100 bg-gray-200 rounded-md px-4 py-2">
        Add
      </button>
      {message && <div className="self-center">{message}</div>}
    </form>
  );
};
