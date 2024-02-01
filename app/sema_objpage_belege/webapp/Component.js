sap.ui.define(["sap/fe/core/AppComponent"], function (Component) {
  "use strict";

  return Component.extend("semaobjpagebelege.Component", {
    metadata: {
      manifest: "json",
    },

    /**
     * Gets the component startup parameters, setting preferredMode to 'create'.
     * @public
     * @returns
     */
    getStartupParameters: function () {
      const oStartupParameters = this.getComponentData().startupParameters;
      return Promise.resolve(
        Object.assign(oStartupParameters, {
          preferredMode: ["display"],
        })
      );
    },
  });
});
