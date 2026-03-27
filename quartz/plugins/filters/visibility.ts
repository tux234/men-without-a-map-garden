import { QuartzFilterPlugin } from "../types"

// ABOUTME: Filter plugin that only publishes notes with visibility: public in frontmatter.
// ABOUTME: Notes without the field or with visibility: private are excluded from the build.

export const VisibilityPublish: QuartzFilterPlugin = () => ({
  name: "VisibilityPublish",
  shouldPublish(_ctx, [_tree, vfile]) {
    return vfile.data?.frontmatter?.visibility === "public"
  },
})
