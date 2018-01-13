export const updateForm = ({ name, value, valid }) => state => ({
  ...state,
  valid,
  [name]: value
});
