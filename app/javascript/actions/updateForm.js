export const updateForm = ({ name, value }) => state => ({
  ...state,
  [name]: value
});
