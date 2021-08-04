export const getIncentives = async (): Promise<Incentive[]> => {
  const resp = await fetch('/api/incentives');
  if (resp.ok) {
    return await resp.json();
  }
  return null;
};

export const updateIncentive = async (id: number, params: Partial<Incentive>): Promise<Incentive> => {
  const resp = await fetch(`/api/incentives/${id}`, {
    method: 'PUT',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify(params),
  });
  if (resp.ok) {
    return await resp.json();
  }
  return null;
};

interface redeemIncentivesResponse {
  message: string;
  errors: boolean;
}
export const redeemIncentives = async (): Promise<redeemIncentivesResponse> => {
  const resp = await fetch('/api/redemption', { method: 'POST' });

  return await resp.json();
};
