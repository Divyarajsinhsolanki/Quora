class Msg < ApplicationRecord
    after_create_commit { broadcast_append_to "msgs" }
    after_destroy_commit { broadcast_update_to "msgs",target: "msgs" }
end
