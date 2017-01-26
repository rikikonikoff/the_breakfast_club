import App from '../src/components/App';
import React from 'react';

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

  describe('visit dishes index page', () => {
    beforeEach(() => {
      let wrapper = mount(
        <App />
      );
    });

    it("shows a list of dishes' names and no reviews", done => {
      setTimeout(() => {
        let pageText = wrapper.text();

        expect(pageText).toMatch("Al's Pancake World fries 1");
        expect(pageText).toMatch("Al's Pancake World fries 2");

        expect(pageText).not.toMatch("This is so yummy 1");

        done();
      }, 0);
    });

    it("redirects to the show page when you click on a dish", done => {
      setTimeout(() => {
        let dish = wrapper.findWhere(n => {
          return n.text() === "Al's Pancake World fries 1";
        });
        simulateIfPresent(dish, 'click');
      }, 0);

      // expect react component to no longer be present
      // expect this error: _registerComponent(...): Target container is not a DOM element.
    });
  });
});
