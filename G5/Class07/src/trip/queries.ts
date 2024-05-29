export const tripQueries = {
  CREATE_TRIP: `
  INSERT INTO trip (destination, notes, status, user_id, start_date, end_date, created_at, updated_at)
  VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id
`,
};
