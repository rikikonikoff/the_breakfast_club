import App from '../src/components/App';

// User Story:
// As a user
// I want to view a list of dishes
// So that I can get breakfast ideas

// Acceptance Criteria:
// * I visit the dishes index page
// * I am presented with a list of dishes
// * Each dish has a name, which is a link to its show page

describe('Dishes Index', () => {
  let wrapper;

  beforeEach(() => {
    spyOn(global, 'fetch').and.returnValue(
      createResponseFromFixture('dishes/dishesIndex')
    );
  });

  afterEach(() => {
    wrapper.unmount();
  });

  describe('visiting the dishes homepage', () => {
    beforeEach(() => {
      wrapper = mount(
        <App />
      );
    });

    it('shows a list of dish names and no reviews', done => {
      setTimeout(() => {
        let pageText = wrapper.text();

        expect(pageText).toMatch("Al's Pancake World fries 1")
        expect(pageText).toMatch("Al's Pancake World fries 2");
        expect(pageText).not.toMatch("This is so yummy 1");

        done();
      },0);
    });
  });
});
