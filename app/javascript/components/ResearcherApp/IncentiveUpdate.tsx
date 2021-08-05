import * as React from 'react';
import { useState } from 'react';
import { updateIncentive } from '@api/endpoints';

interface Props {
  incentive: Incentive;
  handleCancel: any;
  afterSubmit: any;
}

export const IncentiveUpdate: React.FC<Props> = ({ incentive, handleCancel, afterSubmit }) => {
  const [saving, setSaving] = useState(false);
  const [inputCode, setInputCode] = useState(incentive.code);
  const [inputRedeemed, setInputRedeemed] = useState(incentive.redeemed);

  async function handleSubmit(event) {
    event.preventDefault();
    setSaving(true);
    updateIncentive(incentive.id, {
      code: inputCode,
      redeemed: inputRedeemed,
    }).then((updatedIncentive) => {
      setSaving(false);
      afterSubmit(updatedIncentive);
    });
  }

  return (
    <form
      id={`incentive-form-${incentive.id}`}
      className="px-3 py-2 flex space-x-2"
      onSubmit={handleSubmit}
    >
      <input
        disabled={saving}
        className="border px-2 py-1 text-sm rounded"
        type="text"
        name="incentive[code]"
        value={inputCode}
        onChange={(e) => setInputCode(e.currentTarget.value)}
        autoFocus
      />
      <input
        disabled={saving}
        className="border px-2 py-1 text-sm rounded"
        type="checkbox"
        name="incentive[redeemed]"
        value="true"
        checked={inputRedeemed}
        onChange={(e) => setInputRedeemed(e.currentTarget.checked)}
      />
      <button
        type="button"
        disabled={saving}
        className="hover:bg-gray-100 border rounded-md px-4 py-2"
        onClick={handleCancel}
      >
        Cancel
      </button>
      <button
        type="submit"
        disabled={saving}
        className="hover:bg-green-300 bg-green-400 rounded-md px-4 py-2"
      >
        Update
      </button>
    </form>
  );
};
