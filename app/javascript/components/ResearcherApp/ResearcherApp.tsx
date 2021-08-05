import * as React from 'react';
import { useEffect, useState } from 'react';
import { getIncentives } from '@api/endpoints';
import { IncentiveNew } from './IncentiveNew';
import { IncentiveListItem } from './IncentiveListItem';

export const ResearcherApp: React.FC = () => {
  const [loading, setLoading] = useState(true);
  const [incentives, setIncentives] = useState<Incentive[]>(null);

  function addIncentive(incentive) {
    setIncentives([incentive, ...incentives]);
  }

  useEffect(() => {
    getIncentives().then((incentives) => {
      setIncentives(incentives);
      setLoading(false);
    });
  }, []);

  return (
    <div className="px-12 py-6">
      <h1 className="text-2xl font-bold mb-3">Setup incentives</h1>
      <IncentiveNew addIncentive={addIncentive} />
      <ul id="incentives-list" className="border rounded-lg">
        {loading ? (
          <li className="px-3 py-2">Loading...</li>
        ) : (
          incentives.map((incentive) => (
            <IncentiveListItem key={incentive.id} incentive={incentive} />
          ))
        )}
      </ul>
    </div>
  );
};
